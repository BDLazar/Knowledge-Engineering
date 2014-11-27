(clear)
(deftemplate person "People in actuarial database"
    (slot age (default FALSE))
    (slot name)
    (slot gender))
    
(assert (person (name "Bob Smith") (age 34) (gender Male)))
(assert (person (gender Male) (name "Tom Smith") (age 32)))
(assert (person (name "Mary Smith") (age 34) (gender Female)))
(assert (person (gender Female)))
(assert (person  (name "Uncle Tom") (gender Male)))

(defglobal ?*c* = 0       ?*s* = 0)
(defrule males-avg-rule
    (person (gender Male) (age ?a) (name ?n))
    =>
    (if ?a then
        (bind ?*c* (+ ?*c* 1))
        (bind ?*s* (+ ?*s* ?a))
    else
        (printout t "Undefined age for " ?n crlf)))
          
(deffunction get-avg ()	
    (run)
    (bind ?avg (/ ?*s* ?*c*))
    (printout t "Avergae male age is " ?avg crlf))

(get-avg)








    