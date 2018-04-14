/*----------------------------------------------------------------------
 *
 * dust-chain
 * 2018, zhanitest, lgplv3
 *
 ----------------------------------------------------------------------*/
module dust.block;

import std.conv;

import dust.crypto;

class Block{
    ulong index;
    string timestamp;
    string data;
    string previous_hash;
    string hash;

    // Initialize
    this(ulong i, string ts, string dt, string pre_h){
        // 값 초기화
        this.index = i;
        this.timestamp = ts;
        this.data = dt;
        this.previous_hash = pre_h;

        this.hash = gen_hashblock();
    }

    // 블록 내에 데이터 조합
    string mix_msg(){
        return (
             to!string(this.index)
            ~this.timestamp
            ~this.data
            ~this.previous_hash
        );
    }
    
    // 메세지 문자열을 가지고 해쉬생성
    string gen_hashblock(){
        Crypto c = new Crypto(CryptoType.SHA512);
        string msg = c.getcha( this.mix_msg() );
        return msg;
    }
}