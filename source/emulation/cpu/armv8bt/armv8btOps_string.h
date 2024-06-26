#ifndef __ARMV8BTOPS_STRING_H__
#define __ARMV8BTOPS_STRING_H__

void opCmpsb(Armv8btAsm* data);
void opCmpsw(Armv8btAsm* data);
void opCmpsd(Armv8btAsm* data);

void opMovsb(Armv8btAsm* data);
void opMovsw(Armv8btAsm* data);
void opMovsd(Armv8btAsm* data);

void opStosb(Armv8btAsm* data);
void opStosw(Armv8btAsm* data);
void opStosd(Armv8btAsm* data);

void opLodsb(Armv8btAsm* data);
void opLodsw(Armv8btAsm* data);
void opLodsd(Armv8btAsm* data);

void opScasb(Armv8btAsm* data);
void opScasw(Armv8btAsm* data);
void opScasd(Armv8btAsm* data);

#endif