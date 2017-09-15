#include <vector>
#include <Windows.h>


BOOL CALLBACK LW_Enum_Proc(HWND,LPARAM);
std::vector<HWND> hWnds;

int WINAPI WinMain(HINSTANCE hInst,HINSTANCE hPrev,LPTSTR cmdLine,int nCmdShow)
{
    EnumWindows(LW_Enum_Proc,NULL);
    int irow=0;
    int icol=0;
    int iwidth=GetSystemMetrics(SM_CXSCREEN)/2;
    int iheight=GetSystemMetrics(SM_CYSCREEN)/2;
    for(auto& h : hWnds)
    {
        ShowWindow(h,SW_NORMAL);
        SetWindowPos(h,HWND_DESKTOP,irow*iwidth,icol*iheight,iwidth,iheight,SWP_NOACTIVATE);
        icol++;
        if(icol>1)
        {
            icol=0;
            irow++;
            if(irow>1)
            {
                irow=0;
            }
        }
    }
    return 0;
}

BOOL CALLBACK LW_Enum_Proc(HWND hWnd, LPARAM lParam)
{
    wchar_t message[1024]={0};
    wchar_t title[1024]={0};
    RECT rc={0};
    GetWindowRect(hWnd,&rc);
    if(rc.right-rc.left<=0||rc.bottom-rc.top<=0)
    {
        return TRUE;
    }
    BOOL bIsWindow=IsWindow(hWnd);
    if(!bIsWindow)
    {
        return TRUE;
    }
    BOOL bVisible=IsWindowVisible(hWnd);
    if(!bVisible)
    {
        return TRUE;
    }
    GetWindowTextW(hWnd,title,1024);
    if(wcslen(title)<=0)
    {
        return TRUE;
    }
    if(wcscmp(title,L"Photos")==0||wcscmp(title,L"Program Manager")==0)
    {
        return TRUE;
    }
    
    wsprintfW(message,L"%-4d,%-4d,%-4d,%-4d %s\r\n",rc.left,rc.top,rc.right,rc.bottom,title);
    OutputDebugStringW(message);
    hWnds.push_back(hWnd);
    return TRUE;
}