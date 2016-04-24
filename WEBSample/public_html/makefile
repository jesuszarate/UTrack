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

#Add data
ad: adjsp

adjsp:
	scp visitData.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html

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

#Browse
b: btoh bjsp
btoh:
	cp browse.html browse.jsp
bjsp:
	scp browse.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html

#BrowseJSP
bj: bjtoh bjjsp
bjtoh:
	cp browseJSP.html browseJSP.jsp
bjjsp:
	scp browseJSP.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html

#BrowseJSP
d: dtoh djsp
dtoh:
	cp d.html d.jsp
djsp:
	scp d.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html

#Edit POI
ed: edtoh edjsp
edtoh:
	cp editPOI.html editPOI.jsp
edjsp:
	scp editPOI.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html

#Feedback
f: ftoh fjsp
ftoh:
	cp feedback.html feedback.jsp
fjsp:
	scp feedback.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html

#Rate Feedback
rf: rftoh rfjsp
rftoh:
	cp rateFeedback.html rateFeedback.jsp
rfjsp:
	scp rateFeedback.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html

#View
vd: vdtoh vdjsp
vdtoh:
	cp viewData.html viewData.jsp
vdjsp:
	scp viewData.jsp cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html


#Styles
styles:
	scp styles.css cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html

ordcss:
	scp orders.css cs5530u25@georgia.eng.utah.edu:/home/cs5530u25/public_html


clean:
	rm *~
