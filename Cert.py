from PIL import Image, ImageDraw, ImageFont

# Create an Image object
img = Image.new('RGB', (800, 600), color = (255, 255, 255))

# Initialize the drawing context with the Image object
d = ImageDraw.Draw(img)

# Define the font size and type
font = ImageFont.truetype('arial.ttf', size=36)

# Define the text to be written on the certificate
text = 'This certificate is awarded to Zero One LLC for being a certified reseller of VPS services to their UDP custom clients.'

# Calculate the width and height of the text
textwidth, textheight = d.textsize(text, font)

# Calculate the x and y coordinates of the text
x = (img.width - textwidth) / 2
y = (img.height - textheight) / 2

# Draw the text on the certificate
d.text((x, y), text, fill=(0, 0, 0), font=font)

# Save the certificate as a JPG file
img.save('certificate.jpg')

# Display the certificate
img.show()
