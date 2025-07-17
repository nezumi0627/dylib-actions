#include <mach-o/dyld.h>

%hook NLConfigurationManager
-(bool) useNewsTab
{
   return FALSE;
}
%end
