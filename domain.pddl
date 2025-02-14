(define (domain nqueens)
  (:requirements :strips :typing :negative-preconditions :fluents)
  
  (:types 
    queen cell - object
  )

  (:predicates
    (queen-at ?q - queen ?c - cell)
    (used ?q - queen)
    (safe-row ?c - cell)
    (safe-col ?c - cell)
    (safe-diag1 ?c - cell)
    (safe-diag2 ?c - cell)
  )

  (:functions
    (x ?c - cell)  ; X-coordinate of a cell
    (y ?c - cell)  ; Y-coordinate of a cell
    (min_x)  
    (min_y)  
    (max_x)  
    (max_y)  
    (dist ?q1 ?q2 - queen)  ; 
  )
  
  (:action place_queen_at
    :parameters (?q - queen ?c - cell)
    :precondition (and 
      (not (used ?q))
      (safe-row ?c)
      (safe-col ?c)
      (safe-diag1 ?c)
      (safe-diag2 ?c)
    )
    :effect (and
      (used ?q)
      (queen-at ?q ?c)
      (not (safe-row ?c))
      (not (safe-col ?c))
      (not (safe-diag1 ?c))
      (not (safe-diag2 ?c))
    )
  )
)
