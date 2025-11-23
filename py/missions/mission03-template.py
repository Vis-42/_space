# CS1010S --- Programming Methodology
# Mission 3
#

from sys import displayhook

from m3_images import *

###########
# Task 1a #
###########


def flip_vertical(image):
    # Create a copy of the image
    result = make_image(get_width(image), get_height(image))

    # Copy pixels with vertical flip
    for row in range(get_height(image)):
        for col in range(get_width(image)):
            pixel = get_pixel(image, row, col)
            result = set_pixel(result, get_height(image) - row - 1, col, pixel)

    return result


# display(flip_vertical(luna))

# UNCOMMENT THE CODE BELOW TO TEST YOUR TASK 1A
print("## Task 1A ##")
felix_vert = flip_vertical(felix)
print(felix_vert == TEST1A)

print(felix)

# UNCOMMENT THE CODE BELOW TO DISPLAY felix
##display(felix)

# UNCOMMENT THE CODE BELOW TO DISPLAY felix_vert
##display(felix_vert)

###########
# Task 1b #
###########


def flip_horizontal(image):
    # Create a copy of the image
    result = make_image(get_width(image), get_height(image))

    # Copy pixels with horizontal flip
    for row in range(get_height(image)):
        for col in range(get_width(image)):
            pixel = get_pixel(image, row, col)
            result = set_pixel(result, row, get_width(image) - col - 1, pixel)

    return result


# UNCOMMENT THE CODE BELOW TO TEST YOUR TASK 1B
print("## Task 1B ##")
luna_horiz = flip_horizontal(luna)
print(luna_horiz == TEST1B)

# UNCOMMENT THE CODE BELOW TO DISPLAY luna
##display(luna)

# UNCOMMENT THE CODE BELOW TO DISPLAY luna_horiz
##display(luna_horiz)

###########
# Task 1c #
###########


def rotate_clockwise(image):
    # Create new image with swapped dimensions
    result = make_image(get_height(image), get_width(image))

    # Copy pixels with 90-degree clockwise rotation
    for row in range(get_height(image)):
        for col in range(get_width(image)):
            pixel = get_pixel(image, row, col)
            result = set_pixel(result, col, get_height(image) - row - 1, pixel)

    return result


# UNCOMMENT THE CODE BELOW TO TEST YOUR TASK 1C
print("## Task 1C ##")
heart_cw = rotate_clockwise(heart_bb)
print(heart_cw == TEST1C)

# UNCOMMENT THE CODE BELOW TO DISPLAY heart_bb
##display(heart_bb)

# UNCOMMENT THE CODE BELOW TO DISPLAY heart_cw
##display(heart_cw)

################################## DO NOT BREAK PIXEL ABSTRACTION #################################
################################## DO NOT BREAK IMAGE ABSTRACTION #################################

###########
# Task 2a #
###########


def invert(image):
    # Create a copy of the image
    result = make_image(get_width(image), get_height(image))

    # Invert each pixel's RGB values
    for row in range(get_height(image)):
        for col in range(get_width(image)):
            pixel = get_pixel(image, row, col)
            inverted_pixel = make_pixel(
                255 - get_r(pixel), 255 - get_g(pixel), 255 - get_b(pixel)
            )
            result = set_pixel(result, row, col, inverted_pixel)

    return result


# UNCOMMENT THE CODE BELOW TO TEST YOUR TASK 2A
print("## Task 2A ##")
rgb_invert = invert(rgbw)
print(rgb_invert == TEST2A)

# UNCOMMENT THE CODE BELOW TO DISPLAY rgb_img)
##display(rgbw)

# UNCOMMENT THE CODE BELOW TO DISPLAY rgb_invert
##display(rgb_invert)

###########
# Task 2b #
###########


def rgb_to_grayscale(rgb_image):
    # Create a copy of the image
    result = make_image(get_width(rgb_image), get_height(rgb_image))

    # Convert each pixel to grayscale using luminance formula
    for row in range(get_height(rgb_image)):
        for col in range(get_width(rgb_image)):
            pixel = get_pixel(rgb_image, row, col)
            gray_value = int(
                0.21 * get_r(pixel) + 0.72 * get_g(pixel) + 0.07 * get_b(pixel)
            )
            gray_pixel = make_pixel(gray_value, gray_value, gray_value)
            result = set_pixel(result, row, col, gray_pixel)

    return result


# UNCOMMENT THE CODE BELOW TO TEST YOUR TASK 2B
print("## Task 2B ##")
rgb_gray = rgb_to_grayscale(rgbw)
print(rgb_gray == TEST2B)

# UNCOMMENT THE CODE BELOW TO DISPLAY rgb_img
##display(rgbw)

# UNCOMMENT THE CODE BELOW TO DISPLAY rgb_gray
##display(rgb_gray)


###########
# Task 3a #
###########


def threshold(img, val):
    # Create a copy of the image
    result = make_image(get_width(img), get_height(img))

    # Apply threshold to convert to black and white
    for row in range(get_height(img)):
        for col in range(get_width(img)):
            pixel = get_pixel(img, row, col)
            # Calculate luminance/brightness
            brightness = int(
                0.299 * get_r(pixel) + 0.587 * get_g(pixel) + 0.114 * get_b(pixel)
            )

            if brightness >= val:
                new_pixel = WHITE
            else:
                new_pixel = BLACK

            result = set_pixel(result, row, col, new_pixel)

    return result


# UNCOMMENT THE CODE BELOW TO TEST YOUR TASK 3A
print("## Task 3A ##")
luna_bw = threshold(luna, 85)
print(luna_bw == TEST3A)

# UNCOMMENT THE CODE BELOW TO DISPLAY luna
##display(luna)

# UNCOMMENT THE CODE BELOW TO DISPLAY luna_bw
##display(luna_bw)


###########
# Task 3b #
###########


def green_screen(foreground, background, pixel):
    # Create a copy with background dimensions
    result = make_image(get_width(background), get_height(background))

    # Combine foreground and background
    for row in range(get_height(background)):
        for col in range(get_width(background)):
            # Get pixel from foreground if within bounds
            if row < get_height(foreground) and col < get_width(foreground):
                fg_pixel = get_pixel(foreground, row, col)
                # If foreground pixel matches the green screen color, use background
                if (
                    get_r(fg_pixel) == get_r(pixel)
                    and get_g(fg_pixel) == get_g(pixel)
                    and get_b(fg_pixel) == get_b(pixel)
                ):
                    result = set_pixel(
                        result, row, col, get_pixel(background, row, col)
                    )
                else:
                    result = set_pixel(result, row, col, fg_pixel)
            else:
                # Outside foreground bounds, use background
                result = set_pixel(result, row, col, get_pixel(background, row, col))

    return result


# UNCOMMENT THE CODE BELOW TO TEST YOUR TASK 3B
print("## Task 3B ##")
holiday_cats = green_screen(luna_felix, background, GREENSCREEN)
print(holiday_cats == TEST3B)

# UNCOMMENT THE CODE BELOW TO DISPLAY foreground and background
##display(luna_felix)
##display(background)

# UNCOMMENT THE CODE BELOW TO DISPLAY holday_cats
##display(holiday_cats)


######################################### EXTRA (OPTIONAL) #########################################


def save_all():
    # Modify as you like
    save_image(felix, "felix.png")
    save_image(luna, "luna.png")
    save_image(heart_bb, "heart_bb.png")
    save_image(rgb_img, "rgb.png")

    save_image(felix_vert, "felix_vert.png")
    save_image(luna_horiz, "luna_horiz.png")
    save_image(heart_cw, "heart_rot.png")

    save_image(rgb_invert, "rgb_invert.png")
    save_image(rgb_gray, "rgb_gray.png")

    save_image(luna_bw, "luna_bw.png")
    save_image(luna_felix, "luna_felix.png")
    save_image(background, "background.png")
    save_image(holiday_cats, "holiday_cats.png")


# UNCOMMENT TO SAVE ALL IMAGES IN THE CURRENT FOLDER
##save_all()


def decode_your_1010s_grade():
    # How will you see through the noise?
    display(grade)
    # Your code here


# Have fun!
##decode_your_1010s_grade()

# Keep the viewport window open
start_viewport()
