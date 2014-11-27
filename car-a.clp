(clear)

(deftemplate car (slot name) (slot price))

(defglobal ?*min1* = 100000)
(defglobal ?*min2* = 100000)

(deffacts car-facts
   (car (name ford) (price 12000))
   (car (name skoda) (price 5000))
   (car (name ford) (price 8000))
)  

(reset) ;initialises memory to the deffacts facts

; a global variable in the antecedent (LHS) of a rule may 
; lead to errors as this rule does because the rule was activated
; by the original value of ?*min1*

(defrule min-price
    (car (price ?x&:(< ?x ?*min1*)))
    =>
    (printout t "Rule 1 new min price is " ?x ", old is " ?*min1* crlf)
    (bind ?*min1* ?x)
)
 
; This rule is ok
(defrule min-price2
    (car (price ?x))
    =>
    (if (< ?x ?*min2*) then
        (printout t "Rule 2 new min price is " ?x ", old is " ?*min2* crlf)
        (bind ?*min2* ?x))
)    
 

(run)
    