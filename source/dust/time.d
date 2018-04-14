/*----------------------------------------------------------------------
 *
 * dust-chain
 * 2018, zhanitest, lgplv3
 *
 ----------------------------------------------------------------------*/
module dust.time;

import std.datetime.systime;

string get_now(){
	auto time = Clock.currTime();
	return time.toISOExtString();
}