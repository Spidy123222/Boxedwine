#ifndef __FSMEMOPENNODE_H__
#define __FSMEMOPENNODE_H__

#include "fsopennode.h"

class FsMemNode;

class FsMemOpenNode : public FsOpenNode {
public:
    FsMemOpenNode(U32 flags, std::shared_ptr<FsNode> node);
    virtual ~FsMemOpenNode();

    // From FsOpenNode
    S64 length() override;
    bool setLength(S64 length) override;
    S64 getFilePointer() override;
    S64 seek(S64 pos) override;
    U32 map(KThread* thread, U32 address, U32 len, S32 prot, S32 flags, U64 off) override;
    bool canMap() override;
    U32 ioctl(KThread* thread, U32 request) override;
    void setAsync(bool isAsync) override;
    bool isAsync() override;
    void waitForEvents(BOXEDWINE_CONDITION& parentCondition, U32 events) override;
    bool isWriteReady() override;
    bool isReadReady() override;
    U32 readNative(U8* buffer, U32 len) override;
    U32 writeNative(U8* buffer, U32 len) override;
    void close() override;
    void reopen() override;
    bool isOpen() override;

    U64 lastModified() {return this->lastModifiedTime;}
    U32 getSeals() {return this->seals;}
    U32 addSeals(U32 seals);
private:
    U32 seals;
    std::vector<U8> buffer;
    S64 pos;
    bool isClosed;
    U64 lastModifiedTime;
};

#endif