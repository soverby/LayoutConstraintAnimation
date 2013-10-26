LayoutConstraintAnimation
=========================

Demo(s) comparing frame animation with layout constraint animations

This is an example showing two things: Why layout constraints are so effective and the difference 
between frame animation and layout animation.

To see what happens, run the app (in portrait mode, which should be the default), on the 'frame animation' tab you 
won't see an image, click the 'fire animation' button. You'll see that the image animates to the top of the view
centered.

Click the 'reset' button. 

Now rotate the device or simulator left. 

You'll see that the image vanishes - because it's frame y is far below the visible area of the screen.

Now click the 'fire animation' again. You'll see that the images comes in at a skewed angle to the top center of the view. 

Now rotate left three times - you'll see that the image stops being centered and if you click the fire animation button. 

So there are a lot of bad behaviors going on here, we would have to start writing orientation specific code at this point 
and we're likely to generate a lot of edge cases that we have to deal with in code.

Now click on the 'layout constraint animation' tab and follow the same steps as above.

You'll see it works as intended out of the box. We don't have to write any further code, whether you start the app 
in landscape mode, rotate tons of times we always get the expected behavior. 

