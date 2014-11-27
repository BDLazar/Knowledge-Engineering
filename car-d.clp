(clear)
(deftemplate car (slot name) (slot price))


(assert (car (name toyota) (price 3000)))
(assert (car (name fiat) (price 2000)))
(assert (car (name skoda) (price 5000)))
(assert (car (name ford) (price 8000)))
(assert (car (name ford) (price 12000)))

(assert (min-price 100000))


(defrule min-price-rule
    ?fact <- (min-price ?m)
    (car (price ?x&:(< ?x ?m)))
    =>    
    (printout t "New min " ?x ", was " ?m crlf)
    (modify ?fact (__data ?x))
  
)
    
(defrule show-min-price-rule
    (min-price ?m)
    (not (car (price ?p & :(< ?p ?m))))
    (car (name ?n) (price ?m))
    =>
    (printout t "The " ?n " is a minimum price car at " ?m crlf))
    

    