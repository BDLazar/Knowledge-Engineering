(clear)

(deftemplate car (slot name) (slot price))
(deftemplate min-price-car (slot name) (slot price))


(assert (car (name ford) (price 12000)))
(assert (car (name skoda) (price 5000)))
(assert (car (name ford) (price 8000)))

(assert (min-price-car  (price 100000)))

    
(defrule min-price
    ?f <- (min-price-car (price ?m) (name ?n))
    (car (price ?x&:(< ?x ?m)) (name ?y))
    =>
    (printout t "New min price is " ?x ", old is " ?m crlf)
    (retract ?f)
    (assert (min-price-car (price ?x) (name ?y)))
)
   
(run)

    

    