import imageio
imageio.plugins.ffmpeg.download()
from moviepy.editor import *
from InstagramAPI import InstagramAPI


user,pwd = 'damsreseausocial', 'azerty123'

InstagramAPI = InstagramAPI(user,pwd)
InstagramAPI.login() # login

photo_path ='/home/pi/test.jpeg'
caption    = "Sample photo"
InstagramAPI.uploadPhoto(photo_path, caption = caption)
