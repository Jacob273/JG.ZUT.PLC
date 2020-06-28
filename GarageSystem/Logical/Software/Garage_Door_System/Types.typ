
TYPE
	GarageSystem : 	STRUCT 
		Sensors : GarageSensors;
		Motor : Motor;
		StateMachine : StateMachine;
		Indicators : Indicators;
	END_STRUCT;
	GarageSensors : 	STRUCT 
		diCarIsInFront : BOOL;
		diCarIsInside : BOOL;
		diTopIsReached : BOOL := TRUE;
		diBottomIsReached : BOOL := FALSE;
		diMotorIsRunning : BOOL;
	END_STRUCT;
	Motor : 	STRUCT 
		doRunUp : USINT;
		doRunDown : USINT;
	END_STRUCT;
	Indicators : 	STRUCT 
		doLamp : BOOL := FALSE;
		doAwariaSilnika : BOOL := FALSE;
	END_STRUCT;
	StateMachine : 	STRUCT 
		CurrentState : State;
	END_STRUCT;
	State : 
		(
		ErrorState := 0,
		InitialState := 1,
		RunningState := 3
		);
END_TYPE
