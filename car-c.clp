(clear)

(deftemplate car (slot name) (slot price))
(deftemplate min-price (slot price) (slot name))

(assert (car (name ford) (price 12000)))
(assert (car (name skoda) (price 5000)))
(assert (car (name ford) (price 8000)))



    
(defrule min-price-rule
    ?f <- (min-price (price ?m) )
    (car (price ?x&:(< ?x ?m)) (name ?y))
    =>
    (printout t "New min price is " ?x ", old is " ?m crlf)
    (modify ?f (price ?x) (name ?y))
)    
   
(deffunction show-min ()   
   (assert (min-price  (price 100000)))
   (run)
   (assert (done))
   (run)
)

    
(defrule show-rule
    (done)
    (min-price ( price ?p) (name ?n))
    =>
    (printout t "Min price car is " ?n " at " ?p " euros" crlf))
    
(show-min)

    