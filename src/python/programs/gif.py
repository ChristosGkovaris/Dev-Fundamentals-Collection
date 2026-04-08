import imageio.v3 as iio
import glob

# This grabs every .png file in the folder automatically
filenames = glob.glob('team-pic*.png')
images = [iio.imread(f) for f in filenames]

iio.imwrite('team.gif', images, duration = 500, loop = 0)