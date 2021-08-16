(define(domain sokoban)
(:requirements :strips)
    (:predicates 
        (cell ?x)           ;is a cell
        (worker ?w)         ;is a worker
        (box ?b)            ;is a box 
        (left ?x ?y)        ;cell x is left of cell y
        (under ?x ?y)       ;cell x is under cell y
        (at ?x ?y)          ;worker or box x is at location y
        (empty ?x)          ;cell is empty of workers or boxes
    
    )
    (:action move_left      ;worker moves one cell to the left if said cell is empty
        :parameters (?w ?x ?y)
        :precondition (and (worker ?w) 
        (cell ?x)
        (cell ?y)
        (at ?w ?x)
        (left ?y ?x)  
        (empty ?y))  
        :effect (and (at ?w ?y) (not (at ?w ?x)) (empty ?x) (not (empty ?y))))
    
    (:action move_right     ;worker moves one cell to the right if said cell is empty
        :parameters (?w ?x ?y)
        :precondition (and (worker ?w) 
        (cell ?x)
        (cell ?y)
        (at ?w ?x)
        (left ?x ?y)
        (empty ?y))
        :effect (and (at ?w ?y) (not (at ?w ?x)) (empty ?x) (not (empty ?y))))
    
    (:action move_up        ;worker moves one cell up if said cell is empty
        :parameters (?w ?x ?y)
    	:precondition (and (worker ?w)
    	(cell ?x)
        (cell ?y)
    	(at ?w ?x)
    	(under ?x ?y)   
    	(empty ?y))
    	:effect (and (at ?w ?y) (not (at ?w ?x)) (empty ?x) (not (empty ?y))))
    
    (:action move_down      ;worker moves one cell down if said cell is empty
        :parameters (?w ?x ?y)
		:precondition (and (worker ?w)
		(cell ?x)
        (cell ?y)
		(at ?w ?x)
		(under ?y ?x)      					
		(empty ?y))        					
		:effect (and (at ?w ?y) (not (at ?w ?x)) (empty ?x) (not (empty ?y))))
    
    (:action push_left      ;worker has a box to his left and pushes it one cell to the left if said cell is empty
    :parameters (?w ?b ?x ?y ?z)
    :precondition (and (worker ?w)
    (box ?b)
    (cell ?x)
    (cell ?y)
    (cell ?z)
    (left ?y ?x)
    (left ?z ?y)
    (at ?w ?x)
    (at ?b ?y)
    (empty ?z))
    :effect (and (at ?w ?y) (not (at ?w ?x)) (at ?b ?z) (not (at ?b ?y)) (empty ?x) (not (empty ?z))))
    
    (:action push_right     ;worker has a box to his right and pushes it one cell to the right if said cell is empty
		:parameters (?w ?b ?x ?y ?z)
		:precondition (and (worker ?w)
        (box ?b)
        (cell ?x)
        (cell ?y)
        (cell ?z)
        (left ?x ?y)
        (left ?y ?z)
        (at ?w ?x)
        (at ?b ?y)
        (empty ?z))
        :effect (and (at ?w ?y) (not (at ?w ?x)) (at ?b ?z) (not (at ?b ?y)) (empty ?x) (not (empty ?z))))
    
    (:action push_up        ;worker has a box above him and pushes it one cell up if said cell is empty
        :parameters (?w ?b ?x ?y ?z)
		:precondition (and (worker ?w)
		(box ?b)
		(cell ?x)
        (cell ?y)
        (cell ?z)
		(under ?x ?y)
		(under ?y ?z)
		(at ?w ?x)
		(at ?b ?y)
		(empty ?z))
		:effect (and (at ?w ?y) (not (at ?w ?x)) (at ?b ?z) (not (at ?b ?y)) (empty ?x) (not (empty ?z))))
    
    (:action push_down      ;worker has a box under him and pushes it one cell up if said cell is empty
     :parameters (?w ?b ?x ?y ?z)
		:precondition (and (worker ?w)
		(box ?b)
		(cell ?x)
        (cell ?y)
        (cell ?z)
		(under ?y ?x)
		(under ?z ?y)
		(at ?w ?x)
		(at ?b ?y)
		(empty ?z))
		:effect (and (at ?w ?y) (not (at ?w ?x)) (at ?b ?z) (not (at ?b ?y)) (empty ?x) (not (empty ?z))))
    )