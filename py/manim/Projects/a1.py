from manim import *

class CircleAndText(Scene):
    def construct(self):
        # Create a circle
        circle = Circle(radius=2, color=BLUE)

        # Create some text
        text = Text("ma ki chut")

        # Position the text below the circle
        text.next_to(circle, LEFT)

        # Add both objects to the scene
        self.play(Create(circle), Write(text))

        # Keep the scene on the screen for a moment
        self.wait(2)
