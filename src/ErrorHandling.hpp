#ifndef ERROR_HANDLING_H
#define ERROR_HANDLING_H

#include <vector>
#include <string>

namespace ErrorHandling
{
    std::vector<std::string> CheckFile(char *path);
    void isInput(const std::string &line);
    void Help(const char *bin, int returnValue);
};

#endif