#include <iostream>
#include <map>

// Implementation details and commentary is provided within
// ...the corresponding .cpp file.
class Node
{
private:
    // Constructor and destructor.
    Node(std::string _prefix);
    ~Node();

    // Attributes.
    std::string prefix;
    std::map<char, Node *> *childs;
    int code;

    // Friend classes.
    friend class CompactTrie;
};

class CompactTrie
{
public:
    // Constructor and destructor.
    CompactTrie();
    ~CompactTrie();

    // Inserts a new word into the tree.
    void insert(std::string word);

    // Searches for a pattern within the tree.
    bool search(std::string word);

    // Searches for the code of a pattern within the tree.
    // ...Assumes that the pattern is in the tree.
    int getCode(std::string word);

    // Prints the nodes in no specific order.
    void print();

    // Returns the attribute universalCode.
    // ...A matter of encapsulating.
    int getUniversalCode();

private:
    // Attributes.
    Node *root;
    int universalCode;

    // Auxiliary functions.
    void insertAux(Node *_root, std::string word);
    bool searchAux(Node *_root, std::string word);
    int getCodeAux(Node *_root, std::string word);
    void destructorAux(Node *_root);
    void printAux(Node *_root);
};