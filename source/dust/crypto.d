/*----------------------------------------------------------------------
 *
 * dust-chain
 * 2018, zhanitest, lgplv3
 *
 ----------------------------------------------------------------------*/
module dust.crypto;

import std.digest.sha;
//http://lukious.com/2017/12/27/1%ED%8C%8C%EC%9D%B4%EC%8D%AC%EC%9C%BC%EB%A1%9C-%EB%B8%94%EB%A1%9D%EC%B2%B4%EC%9D%B8-%EA%B5%AC%EC%A1%B0-%EB%A7%8C%EB%93%A4%EA%B8%B0/
enum CryptoType{
    SHA512
    //,SHA256
    //,SCRYPT
}

/*
    암호화 래퍼
 */
class Crypto{
    CryptoType type;

    // 타입 초기화
    this(CryptoType t){
        this.type = t;
    }

    // 메세지 넣고 바로 해쉬로 받기
    string getcha(string text){
        if(this.type == CryptoType.SHA512){ // 패턴 바꿀 필요 있음...
            ubyte[] result = sha512Of(text);
            return toHexString(result);
        }
        return "";
    }
}

unittest{
    Crypto c = new Crypto(CryptoType.SHA512);
    assert(
        c.getcha("dustchain")=="60F91481DE89F9109125017303B34CBAC042EC6C6EDF605CB4105BF6510773B274D5A69E2552221845961930A1BB6E5580194E8B993C45C4F29E367677CD0BAC"
    );
}