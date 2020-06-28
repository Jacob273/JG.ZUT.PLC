
PROGRAM _INIT
	 
	//Initial state
	Garage[0].StateMachine.CurrentState := InitialState;
	
	//Delay for getting gate up
	Timers[0].PT := T#2s;
	
	//Delay for getting gate down
	Timers[1].PT := T#2s;
	
	Timers[2].PT := T3s#
	
END_PROGRAM

PROGRAM _CYCLIC
	
	Garage[0].StateMachine.CurrentState := RunningState;
	
	CASE Garage[0].StateMachine.CurrentState OF 
		RunningState:
			
			//Main logic
			Timers[0].IN := Garage[0].Sensors.diCarIsInFront AND Garage[0].Sensors.diTopIsReached;
			Timers[0]();
			
			Timers[1].IN := Garage[0].Sensors.diCarIsInside AND Garage[0].Sensors.diBottomIsReached;
			Timers[1]();
				
			Timers[2]();
			
			//Timer that makes motor to run in up direction
			Garage[0].Motor.doRunUp := Timers[0].Q;

			//Timer that makes motor to run in down direction
			Garage[0].Motor.doRunDown := Timers[1].Q;		

			//Lamp that informs whether the motor is running
			Garage[0].Indicators.doLamp := USINT_TO_BOOL(Garage[0].Motor.doRunDown OR Garage[0].Motor.doRunUp);
		
		
			//Simple check if theres signal for up and down and the same time which is not valid 
			Garage[0].Indicators.doAwariaSilnika := USINT_TO_BOOL(Garage[0].Motor.doRunUp AND Garage[0].Motor.doRunDown);
			
			IF Garage[0].Indicators.doAwariaSilnika = TRUE THEN		
				Garage[0].StateMachine.CurrentState := ErrorState;
			END_IF

		ErrorState:
			//Handling error state
			Garage[0].Motor.doRunUp := 0;
			Garage[0].Motor.doRunDown := 0;
	END_CASE;
	

END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM

