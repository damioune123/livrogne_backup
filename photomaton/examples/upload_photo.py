import imageio
imageio.plugins.ffmpeg.download()
from moviepy.editor import *
from InstagramAPI import InstagramAPI


user,pwd = 'user', 'password'

InstagramAPI = InstagramAPI(user,pwd)
InstagramAPI.login() # login

photo_path ='/path/to/photo.jpg'
caption    = "Sample photo"
InstagramAPI.uploadPhoto(photo_path, caption = caption)
