;szablony oraz zestaw faktów

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;reguła uruchamiająca

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;reguły zapytań

(defrule determine-video-game-based ""

   (logical (start))

   =>

   (assert (UI-state (display StartQuestion)
                     (relation-asserted like-video-game)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-nintendo ""

   (logical (like-video-game Yes))

   =>

   (assert (UI-state (display NintendoQuestion)
                     (relation-asserted nintendo)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-celebrity ""

   (logical (like-video-game No))

   =>

   (assert (UI-state (display CelebrityQuestion)
                     (relation-asserted celebrity)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-animals ""

   (logical (celebrity No))

   =>

   (assert (UI-state (display AnimalsQuestion)
                     (relation-asserted animals)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-cats ""

   (logical (animals Yes))

   =>

   (assert (UI-state (display CatsQuestion)
                     (relation-asserted cats)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-rodents ""

   (logical (cats No))

   =>

   (assert (UI-state (display RodentsQuestion)
                     (relation-asserted rodents)
                     (response No)
                     (valid-answers No Yes))))


(defrule determine-dinosaurs ""

   (logical (rodents No))

   =>

   (assert (UI-state (display DinosaursQuestion)
                     (relation-asserted dinosaurs)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-ducks ""

   (logical (dinosaurs No))

   =>

   (assert (UI-state (display DucksQuestion)
                     (relation-asserted ducks)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-bears ""

   (logical (ducks No))

   =>

   (assert (UI-state (display BearsQuestion)
                     (relation-asserted bears)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-monkeys ""

   (logical (bears No))

   =>

   (assert (UI-state (display MonkeysQuestion)
                     (relation-asserted monkeys)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-cows ""

   (logical (monkeys No))

   =>

   (assert (UI-state (display CowsQuestion)
                     (relation-asserted cows)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-abominations ""

   (logical (cows No))

   =>

   (assert (UI-state (display AbominationsQuestion)
                     (relation-asserted abominations)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-robots ""

   (logical (animals No))

   =>

   (assert (UI-state (display RobotsQuestion)
                     (relation-asserted robots)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-movie-based ""

   (logical (robots No))

   =>

   (assert (UI-state (display MovieBasedQuestion)
                     (relation-asserted movie-based)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-r-rated ""

   (logical (movie-based Yes))

   =>

   (assert (UI-state (display RRatedQuestion)
                     (relation-asserted r-rated)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-post-apo ""

   (logical (movie-based No))

   =>

   (assert (UI-state (display PostApoQuestion)
                     (relation-asserted post-apo)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-swords ""

   (logical (post-apo No))

   =>

   (assert (UI-state (display SwordsQuestion)
                     (relation-asserted swords)
                     (response No)
                     (valid-answers No Yes))))


(defrule determine-military-law ""

   (logical (swords No))

   =>

   (assert (UI-state (display MilitaryQuestion)
                     (relation-asserted military-law)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-space""

   (logical (military-law No))

   =>

   (assert (UI-state (display SpaceQuestion)
                     (relation-asserted space)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-cowboys ""

   (logical (space No))

   =>

   (assert (UI-state (display CowboysQuestion)
                     (relation-asserted cowboys)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-understand ""

   (logical (cowboys No))

   =>

   (assert (UI-state (display UnderstandQuestion)
                     (relation-asserted understand)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-awesome-way ""

   (logical (understand No))

   =>

   (assert (UI-state (display AwesomeWayQuestion)
                     (relation-asserted awesome-way)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-kids-awesome ""

   (logical (understand Yes))

   =>

   (assert (UI-state (display KidsAwesomeQuestion)
                     (relation-asserted kids-awesome)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-educational ""

   (logical (kids-awesome Yes))

   =>

   (assert (UI-state (display EducationalQuestion)
                     (relation-asserted educational)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-computers ""

   (logical (kids-awesome No))

   =>

   (assert (UI-state (display ComputersQuestion)
                     (relation-asserted computers)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-outrageous ""

   (logical (computers No))

   =>

   (assert (UI-state (display OutrageousQuestion)
                     (relation-asserted outrageous)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-undead ""

   (logical (outrageous No))

   =>

   (assert (UI-state (display UndeadQuestion)
                     (relation-asserted undead)
                     (response No)
                     (valid-answers No Yes))))


;reguły końcowe

(defrule nintendo-No ""

   (logical (nintendo No))
   
   =>

   (assert (UI-state (display NotNintendo)
                     (state final))))

(defrule nintendo-Yes ""

   (logical (nintendo Yes))
   
   =>

   (assert (UI-state (display Nintendo)
                     (state final))))

(defrule celebrity-Yes ""

   (logical (celebrity Yes))
   
   =>

   (assert (UI-state (display Celebrities)
                     (state final))))

(defrule cats-Yes ""

   (logical (cats Yes))
   
   =>

   (assert (UI-state (display Cats)
                     (state final))))

(defrule rodents-Yes ""

   (logical (rodents Yes))
   
   =>

   (assert (UI-state (display Rodents)
                     (state final))))

(defrule dinosaurs-Yes ""

   (logical (dinosaurs Yes))
   
   =>

   (assert (UI-state (display Dinosaurs)
                     (state final))))

(defrule ducks-Yes ""

   (logical (ducks Yes))
   
   =>

   (assert (UI-state (display Ducks)
                     (state final))))

(defrule bears-Yes ""

   (logical (bears Yes))
   
   =>

   (assert (UI-state (display Bears)
                     (state final))))

(defrule monkeys-Yes ""

   (logical (monkeys Yes))
   
   =>

   (assert (UI-state (display Monkeys)
                     (state final))))

(defrule cows-Yes ""

   (logical (cows Yes))
   
   =>

   (assert (UI-state (display Cows)
                     (state final))))

(defrule abominations-Yes ""

   (logical (abominations Yes))
   
   =>

   (assert (UI-state (display Abominations)
                     (state final))))

(defrule abominations-No ""

   (logical (abominations No))
   
   =>

   (assert (UI-state (display OtherAnimaals)
                     (state final))))

(defrule robots-Yes ""

   (logical (robots Yes))
   
   =>

   (assert (UI-state (display Robots)
                     (state final))))

(defrule r-rated-Yes ""

   (logical (r-rated Yes))
   
   =>

   (assert (UI-state (display RRated)
                     (state final))))

(defrule r-rated-No ""

   (logical (r-rated No))
   
   =>

   (assert (UI-state (display NotRRated)
                     (state final))))

(defrule post-apo-Yes ""

   (logical (post-apo Yes))
   
   =>

   (assert (UI-state (display PostApo)
                     (state final))))

(defrule swords-Yes ""

   (logical (swords Yes))
   
   =>

   (assert (UI-state (display Swords)
                     (state final))))


(defrule military-law-Yes ""

   (logical (military-law Yes))
   
   =>

   (assert (UI-state (display MilitaryLaw)
                     (state final))))


(defrule space-Yes ""

   (logical (space Yes))
   
   =>

   (assert (UI-state (display Space)
                     (state final))))


(defrule cowboys-Yes ""

   (logical (cowboys Yes))
   
   =>

   (assert (UI-state (display Cowboys)
                     (state final))))

(defrule awesome-way-Yes ""

   (logical (awesome-way Yes))
   
   =>

   (assert (UI-state (display AwesomeWay)
                     (state final))))

(defrule awesome-way-No ""

   (logical (awesome-way No))
   
   =>

   (assert (UI-state (display NotAwesome)
                     (state final))))

(defrule educational-Yes ""

   (logical (educational Yes))
   
   =>

   (assert (UI-state (display Educational)
                     (state final))))

(defrule educational-No ""

   (logical (educational No))
   
   =>

   (assert (UI-state (display NotEducational)
                     (state final))))

(defrule computers-Yes ""

   (logical (computers Yes))
   
   =>

   (assert (UI-state (display Computers)
                     (state final))))

(defrule outrageous-Yes ""

   (logical (outrageous Yes))
   
   =>

   (assert (UI-state (display Outrageous)
                     (state final))))

(defrule undead-Yes ""

   (logical (undead Yes))
   
   =>

   (assert (UI-state (display Undead)
                     (state final))))


(defrule undead-No ""

   (logical (undead No))
   
   =>

   (assert (UI-state (display NotUndead)
                     (state final))))
                     
;regu³y interakcji interfejsu u¿ytkownika

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
