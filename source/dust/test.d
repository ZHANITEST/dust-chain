/*----------------------------------------------------------------------
 *
 * dust-chain
 * 2018, zhanitest, lgplv3
 *
 ----------------------------------------------------------------------*/
module dust.test;

import dust.time;
import dust.block;

// 제네시스 블록 생성
Block create_gblock(){
	return (new Block(0, get_now(), "Genesis Block is Born!", "0"));
}

// 그 다음 블럭
Block and_next(Block last_bl){
	ulong index = last_bl.index+1;
	string timestamp = get_now();
	string data = "hello my friend!";
	string h = last_bl.hash;

	return ( new Block( index, timestamp, data, h) );
}

 