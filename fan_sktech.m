/*    -----Notes-----
air temp lcd
meat twmp lcd



webserver:

program selector (simple, soft aproach, ramp air temp, meat temperature differintial)

write initial user variables
update button??
read/write user varible each loop?


long air_temp;
int air_set;
long meat_temp;
int meat_set;
long fan_output;

long scale_temp;
long scale_fan;

//Program selector from web sever (i.e. simple, ramp, temperature change rate) 

//Meat selector from web server (e.g. {Beef, meat_set = 150; Pork, meat_set = 165; … } meat_selection

//Pin 1 is air temperature input (mA)

//Pin 2 is meat te<mperature input (mA)

//Pin 11 is fan power output (V) 

//Simple

While meat_temp < meat_set - carry_over
	
	air_temp = scale_temp*Pin01
	meat_temp = scale_temp*Pin02
	Pin11 = scale_fan*fan_output
	
	If air_temp < air_set
		fan_output = 100
	
	If air_temp > meat_set + 100
		fan_output = 0
		


*/

/*-----------input/output-------------*/
long meattemp = A0;
long airtemp = A1;
long fan=A3;

/*-----------user varables------------*/
int airsetpoint;
int meatsetpoint;
int carry_over = 5;
int wait = 1000

void setup()
{
	Serial.begin(9600);
	pinMode(meattemp, INPUT);
	pinMode(airtemp, INPUT);
	pinMode(fan, OUTPUT);
}
	
/*--------simple meat temp------------*/

void loop()
{
	analogRead(meattemp);
	analogRead(airtemp);
	
	while (meattemp < meatsetpoint - carry_over)
	
   if(airtemp < airsetpoint - 5)
   fanspeed(0);
	
	else fanspeed(100);
	delay(wait);	

	
}

int fanSpeed(int speed) //speed% 0-100
{

analogWrite(fan, 0.255 * speed);

}