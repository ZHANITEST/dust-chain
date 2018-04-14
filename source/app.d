/*----------------------------------------------------------------------
 *
 * dust-chain
 * 2018, zhanitest, lgplv3
 *
 ----------------------------------------------------------------------*/
import std.stdio;
import std.string;

import dust.time;
import dust.block;
import dust.config;

void main()
{
	writeln("\ndust-chain cli v", VERSION, "(",BUILD,")\n");
}

unittest{
	import dust.test;
	Block[] dustchains;
	dustchains ~= create_gblock();
	Block b1 = dustchains[0];

	for(int i=0; i<21; i++){
		Block b2 = and_next(b1);
		dustchains ~= b2;
		b1 = b2;
		writeln("Block #", (b2.index) ,"has been added to the chain!");
		writeln("Hash: ", (b2.hash) );
	}
}