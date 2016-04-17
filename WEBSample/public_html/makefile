all: htoj ojsp
ojsp:
	scp orders.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html
htoj:
	cp orders.html orders.jsp


reg: htor rjsp

rjsp:
	scp register.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html
htor:
	cp register.html register.jsp


ind: itoh ijsp

itoh:
	cp index.html index.jsp
ijsp:
	scp index.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html

#Sign in 
sin: stoh sjsp

stoh:
	cp signin.html signin.jsp
sjsp:
	scp signin.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html

#Sign out
sout: sotoh sojsp

sotoh:
	cp signout.html signout.jsp
sojsp:
	scp signout.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html

#Add visit
av: avtoh avjsp

avtoh:
	cp addVisit.html addVisit.jsp
avjsp:
	scp addVisit.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html

#Add new POI
ap: aptoh apjsp
aptoh:
	cp addNewPOI.html addNewPOI.jsp
apjsp:
	scp addNewPOI.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html


#Styles
styles:
	scp styles.css cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html

ordcss:
	scp orders.css cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html


clean:
	rm *~
