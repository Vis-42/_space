using Plots, GR
using SparseArrays, LinearAlgebra
using Printf

# Use GR backend for stable 3D plotting
gr()

# Physical constants
const ℏ = 1.054571817e-34  # Reduced Planck constant
const mₑ = 9.1093837015e-31  # Electron mass

# Simulation parameters
const N = 4000
const L = 2e-8
const dx = L / N
const dt = 1e-18
const x = range(0, L, length=N)

# Global simulation state
mutable struct SimulationState
    ψ::Vector{ComplexF64}
    V::Vector{Float64}
    A::SparseMatrixCSC{ComplexF64,Int}
    B::SparseMatrixCSC{ComplexF64,Int}
    time_step::Int
    k₀::Float64
    V_amplitude::Float64
    barrier_start::Int
    barrier_end::Int
    playing::Bool
    speed_factor::Int
    zoom_scale::Float64
    initial_max_val::Float64
    previous_time_step::Int

    # Visualization parameters
    fixed_amplitude_scale::Float64
    probability_scale_factor::Float64
    potential_visual_scale::Float64

    # Wave packet parameters
    σ::Float64
    x_wave₀::Float64
end

# Initialize simulation state
function create_simulation_state()
    k₀_initial = 6e10
    σ = 2e-10
    x_wave₀ = L / 4
    V_amplitude = 0.0

    state = SimulationState(
        Vector{ComplexF64}(undef, N),  # ψ
        zeros(N),                      # V
        spzeros(ComplexF64, N, N),     # A
        spzeros(ComplexF64, N, N),     # B
        0,                             # time_step
        k₀_initial,                    # k₀
        V_amplitude,                   # V_amplitude
        0, 0,                          # barrier_start, barrier_end
        false,                         # playing
        1,                             # speed_factor
        1.0,                           # zoom_scale
        0.0,                           # initial_max_val
        0,                             # previous_time_step
        2.0,                           # fixed_amplitude_scale
        5.0,                           # probability_scale_factor
        1e18,                          # potential_visual_scale
        σ,                             # σ
        x_wave₀                        # x_wave₀
    )

    initialize_wave!(state, k₀_initial)
    update_potential!(state, V_amplitude)
    update_operators!(state)
    state.initial_max_val = maximum(abs.(state.ψ))

    return state
end

# Initialize normalized Gaussian wave packet
function initialize_wave!(state::SimulationState, k₀_value::Float64)
    @. state.ψ = exp(-((x - state.x_wave₀)^2) / (2 * state.σ^2)) * exp(1im * k₀_value * x)
    normalize!(state.ψ)
    state.k₀ = k₀_value
end

# Update potential array with barrier in center
function update_potential!(state::SimulationState, V_amp::Float64)
    fill!(state.V, 0.0)
    barrier_width = Int(0.2 * N)
    center_index = N ÷ 2
    start_idx = center_index - barrier_width ÷ 2
    end_idx = center_index + barrier_width ÷ 2

    state.barrier_start = start_idx
    state.barrier_end = end_idx
    state.V[start_idx:end_idx] .= V_amp
    state.V_amplitude = V_amp
end

# Update time evolution operators using Crank-Nicolson scheme
function update_operators!(state::SimulationState)
    # Diagonal elements
    a_diag = @. 1 + 1im * ℏ * dt / (2 * mₑ * dx^2) + 1im * dt / (2 * ℏ) * state.V
    b_diag = @. 1 - 1im * ℏ * dt / (2 * mₑ * dx^2) - 1im * dt / (2 * ℏ) * state.V

    # Off-diagonal elements
    off_diag_val = -1im * ℏ * dt / (4 * mₑ * dx^2)
    off_diag = fill(off_diag_val, N - 1)

    # Create sparse matrices
    state.A = spdiagm(-1 => off_diag, 0 => a_diag, 1 => off_diag)
    state.B = spdiagm(-1 => -off_diag, 0 => b_diag, 1 => -off_diag)
end

# Evolve wavefunction for given number of steps
function evolve_wavefunction!(state::SimulationState, steps::Int)
    for _ in 1:abs(steps)
        if steps > 0
            state.ψ = state.A \ (state.B * state.ψ)
        else
            state.ψ = state.B \ (state.A * state.ψ)
        end
    end
end

# Calculate adaptive x-axis limits based on wave packet spread
function calculate_xlimits(state::SimulationState)
    prob_density = abs2.(state.ψ)
    center_of_mass = sum(x .* prob_density) / sum(prob_density)
    spread = sqrt(sum(((x .- center_of_mass) .^ 2) .* prob_density) / sum(prob_density))

    x_min = max(0, center_of_mass - state.zoom_scale * 3 * spread)
    x_max = min(L, center_of_mass + state.zoom_scale * 3 * spread)

    return x_min, x_max
end

# Create 3D visualization of the quantum state
function create_plot(state::SimulationState)
    x_min, x_max = calculate_xlimits(state)

    # Create mask for x-range
    mask = (x .>= x_min) .& (x .<= x_max)
    x_plot = collect(x[mask])

    # Extract wavefunction components
    ψ_real = real(state.ψ[mask])
    ψ_imag = imag(state.ψ[mask])
    ψ_prob = state.probability_scale_factor .* abs2.(state.ψ[mask])

    # Set fixed amplitude limits
    y_lim = state.fixed_amplitude_scale * state.initial_max_val
    z_lim = state.fixed_amplitude_scale * state.initial_max_val

    # Create 3D plot
    p = Plots.plot(
        title="Quantum Wave Packet Evolution",
        xlabel="Position x (m)",
        ylabel="Imaginary Component",
        zlabel="Real Component",
        xlims=(x_min, x_max),
        ylims=(-y_lim, y_lim),
        zlims=(-z_lim, z_lim),
        size=(1000, 800),
        camera=(45, 30),
        legend=:topright
    )

    # Plot wavefunction components as 3D lines
    Plots.plot!(p, x_plot, zeros(length(x_plot)), ψ_real,
        linewidth=2, color=:blue, label="Re(Ψ)")

    Plots.plot!(p, x_plot, ψ_imag, zeros(length(x_plot)),
        linewidth=2, color=:green, label="Im(Ψ)")

    Plots.plot!(p, x_plot, ψ_real, ψ_imag,
        linewidth=2, color=:purple, label="Re(Ψ)+Im(Ψ)")

    Plots.plot!(p, x_plot, zeros(length(x_plot)), ψ_prob,
        linewidth=2, color=:red, label="|Ψ|²")

    # Add potential barrier visualization
    if state.V_amplitude > 0
        barrier_x_start = x[state.barrier_start]
        barrier_x_end = x[state.barrier_end]

        # Vertical lines at barrier edges
        Plots.plot!(p, [barrier_x_start, barrier_x_start], [-y_lim, y_lim], [0, 0],
            linewidth=3, color=:orange, label="Barrier", alpha=0.8)
        Plots.plot!(p, [barrier_x_end, barrier_x_end], [-y_lim, y_lim], [0, 0],
            linewidth=3, color=:orange, label="", alpha=0.8)

        # Potential profile
        V_plot = state.potential_visual_scale .* state.V[mask]
        y_potential = -0.7 * y_lim
        Plots.plot!(p, x_plot, fill(y_potential, length(x_plot)), V_plot,
            linewidth=2, color=:cyan, label="Potential")

        # Add annotation for potential value
        center_idx = (state.barrier_start + state.barrier_end) ÷ 2
        if center_idx <= length(x)
            Plots.annotate!(p, x[center_idx], y_potential,
                state.potential_visual_scale * state.V[center_idx],
                Plots.text(@sprintf("V = %.2e J", state.V_amplitude), 10, :cyan))
        end
    end

    # Add time step annotation
    Plots.annotate!(p, x_min + 0.7 * (x_max - x_min), -0.8 * y_lim, 0,
        Plots.text(@sprintf("Time Step: %d", state.time_step), 12, :black))

    return p
end

# Alternative 2D multi-panel view for better compatibility
function create_2d_plot(state::SimulationState)
    x_min, x_max = calculate_xlimits(state)
    mask = (x .>= x_min) .& (x .<= x_max)
    x_plot = collect(x[mask])

    ψ_real = real(state.ψ[mask])
    ψ_imag = imag(state.ψ[mask])
    ψ_prob = abs2.(state.ψ[mask])

    # Create subplot layout
    p1 = plot(x_plot, ψ_real, title="Real Part", xlabel="x (m)", ylabel="Re(Ψ)",
        color=:blue, linewidth=2, xlims=(x_min, x_max))

    p2 = plot(x_plot, ψ_imag, title="Imaginary Part", xlabel="x (m)", ylabel="Im(Ψ)",
        color=:green, linewidth=2, xlims=(x_min, x_max))

    p3 = plot(x_plot, ψ_prob, title="Probability Density", xlabel="x (m)", ylabel="|Ψ|²",
        color=:red, linewidth=2, xlims=(x_min, x_max))

    # Add potential to probability plot
    if state.V_amplitude > 0
        V_normalized = state.V[mask] / maximum(state.V) * maximum(ψ_prob) * 0.5
        plot!(p3, x_plot, V_normalized, color=:orange, linewidth=2, alpha=0.7,
            label="Potential (scaled)")
    end

    # Combine plots
    p = plot(p1, p2, p3, layout=(3, 1), size=(800, 600))

    # Add title with time step
    plot!(p, plot_title=@sprintf("Quantum Wave Evolution - Time Step: %d", state.time_step))

    return p
end

# Update simulation by evolving time steps
function update_simulation!(state::SimulationState, new_time_step::Int)
    direction = new_time_step > state.previous_time_step ? 1 : -1
    steps = abs(new_time_step - state.previous_time_step)

    evolve_wavefunction!(state, steps * direction)
    state.previous_time_step = new_time_step
    state.time_step = new_time_step
end

# Reset simulation with new momentum
function reset_with_momentum!(state::SimulationState, k₀_new::Float64)
    initialize_wave!(state, k₀_new)
    state.time_step = 0
    state.previous_time_step = 0
    state.initial_max_val = maximum(abs.(state.ψ))
end

# Reset simulation with new potential
function reset_with_potential!(state::SimulationState, V_new::Float64)
    update_potential!(state, V_new)
    update_operators!(state)
    initialize_wave!(state, state.k₀)
    state.time_step = 0
    state.previous_time_step = 0
    state.initial_max_val = maximum(abs.(state.ψ))
end

# Interactive simulation runner
function run_interactive_simulation(use_3d::Bool=true)
    state = create_simulation_state()

    println("🌊 Quantum Wave Packet Simulation")
    println("="^50)
    println("Plotting mode: $(use_3d ? "3D" : "2D multi-panel")")
    println("Commands:")
    println("  p: Play/Pause animation")
    println("  f: Step forward (+10 steps)")
    println("  b: Step backward (-10 steps)")
    println("  +: Speed up")
    println("  -: Slow down")
    println("  z: Change zoom (enter factor)")
    println("  k: Change momentum (enter k₀ value)")
    println("  v: Change potential (enter V value)")
    println("  t: Go to specific time step")
    println("  r: Reset to initial state")
    println("  3: Toggle 3D/2D view")
    println("  q: Quit")
    println("="^50)

    # Create initial plot
    p = use_3d ? create_plot(state) : create_2d_plot(state)
    display(p)

    max_time = 5000

    while true
        print("Enter command: ")
        cmd = strip(readline())

        if cmd == "q"
            println("Goodbye! 👋")
            break
        elseif cmd == "3"
            use_3d = !use_3d
            p = use_3d ? create_plot(state) : create_2d_plot(state)
            display(p)
            println("📊 Switched to $(use_3d ? "3D" : "2D") view")
        elseif cmd == "p"
            if state.playing
                state.playing = false
                println("⏸️  Paused")
            else
                state.playing = true
                println("▶️  Playing animation...")

                # Animation loop
                while state.playing
                    state.time_step += state.speed_factor
                    if state.time_step > max_time
                        state.time_step = 0
                    end

                    update_simulation!(state, state.time_step)
                    p = use_3d ? create_plot(state) : create_2d_plot(state)
                    display(p)

                    sleep(0.1)  # Control animation speed

                    # Simple pause check (you'll need to press Enter to pause)
                    if kbhit()
                        readline()  # consume the input
                        state.playing = false
                        println("⏸️  Paused")
                    end
                end
            end

        elseif cmd == "f"
            state.time_step = min(max_time, state.time_step + 10)
            update_simulation!(state, state.time_step)
            p = use_3d ? create_plot(state) : create_2d_plot(state)
            display(p)
            println("⏭️  Forward to step $(state.time_step)")

        elseif cmd == "b"
            state.time_step = max(0, state.time_step - 10)
            update_simulation!(state, state.time_step)
            p = use_3d ? create_plot(state) : create_2d_plot(state)
            display(p)
            println("⏮️  Back to step $(state.time_step)")

        elseif cmd == "+"
            state.speed_factor = min(32, state.speed_factor * 2)
            println("⚡ Speed: $(state.speed_factor)x")

        elseif cmd == "-"
            state.speed_factor = max(1, state.speed_factor ÷ 2)
            println("🐌 Speed: $(state.speed_factor)x")

        elseif cmd == "z"
            print("Enter zoom factor (0.1-2.0): ")
            try
                zoom = parse(Float64, readline())
                state.zoom_scale = clamp(zoom, 0.1, 2.0)
                p = use_3d ? create_plot(state) : create_2d_plot(state)
                display(p)
                println("🔍 Zoom: $(state.zoom_scale)x")
            catch
                println("❌ Invalid zoom factor")
            end

        elseif cmd == "k"
            print("Enter momentum k₀ (1e10 - 1e11): ")
            try
                k₀ = parse(Float64, readline())
                k₀ = clamp(k₀, 1e10, 1e11)
                reset_with_momentum!(state, k₀)
                p = use_3d ? create_plot(state) : create_2d_plot(state)
                display(p)
                println("🎯 Momentum k₀: $(k₀)")
            catch
                println("❌ Invalid momentum value")
            end

        elseif cmd == "v"
            print("Enter potential V (0 - 1e-17): ")
            try
                V = parse(Float64, readline())
                V = clamp(V, 0.0, 1e-17)
                reset_with_potential!(state, V)
                p = use_3d ? create_plot(state) : create_2d_plot(state)
                display(p)
                println("⚡ Potential V: $(V)")
            catch
                println("❌ Invalid potential value")
            end

        elseif cmd == "t"
            print("Enter time step (0-$(max_time)): ")
            try
                t = parse(Int, readline())
                t = clamp(t, 0, max_time)
                update_simulation!(state, t)
                p = use_3d ? create_plot(state) : create_2d_plot(state)
                display(p)
                println("⏰ Time step: $(t)")
            catch
                println("❌ Invalid time step")
            end

        elseif cmd == "r"
            state = create_simulation_state()
            p = use_3d ? create_plot(state) : create_2d_plot(state)
            display(p)
            println("🔄 Reset to initial state")

        else
            println("❓ Unknown command: $(cmd)")
        end
    end
end

# Simple keyboard hit detection
function kbhit()
    return bytesavailable(stdin) > 0
end

# Main execution
function main()
    println("Initializing quantum simulation...")
    println("Choose plotting backend:")
    println("1. Try 3D visualization (may have compatibility issues)")
    println("2. Use 2D multi-panel view (more stable)")
    print("Enter choice (1 or 2): ")

    choice = readline()
    use_3d = choice == "1"

    try
        run_interactive_simulation(use_3d)
    catch e
        if use_3d
            println("⚠️  3D plotting failed: $e")
            println("Falling back to 2D visualization...")
            run_interactive_simulation(false)
        else
            rethrow(e)
        end
    end
end

# Run the simulation
if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
