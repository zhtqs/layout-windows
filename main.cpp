#include <vector>
#include <Windows.h>
#include <assert.h>

BOOL CALLBACK LW_Enum_Proc(HWND,LPARAM);
std::vector<HWND> hWnds;

int WINAPI WinMain(HINSTANCE hInst,HINSTANCE hPrev,LPTSTR cmdLine,int nCmdShow)
{
    EnumWindows(LW_Enum_Proc,NULL);
    int irow=0;
    int icol=0;
    //int iwidth=GetSystemMetrics(SM_CXSCREEN)/2;
    //int iheight=GetSystemMetrics(SM_CYSCREEN)/2-20;
    //POINT pt={0};
    //MONITORINFO mi={0};
    //HMONITOR hMonitor=MonitorFromPoint(pt,MONITOR_DEFAULTTOPRIMARY);
    //GetMonitorInfoA(hMonitor,&mi);
    RECT rc={0};
    SystemParametersInfoA(SPI_GETWORKAREA,0,&rc,0);
    int iwidth=(rc.right-rc.left)/2;
    int iheight=(rc.bottom-rc.top)/2;
    assert(iwidth>100&&iheight>100);
    for(std::vector<HWND>::iterator it=hWnds.begin();it!=hWnds.end();it++)
    {
        HWND h=*it;//copy memory
        ShowWindow(h,SW_NORMAL);
        SetWindowPos(h,HWND_DESKTOP,irow*iwidth-8,icol*iheight-5,iwidth+16,iheight+10,SWP_NOACTIVATE);
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
    WINDOWPLACEMENT wd={0};
    GetWindowPlacement(hWnd,&wd);
    if(wd.showCmd==SW_MINIMIZE||wd.showCmd==SW_HIDE||wd.showCmd==SW_SHOWMINIMIZED||wd.showCmd==SW_SHOWMAXIMIZED||wd.showCmd==SW_MAXIMIZE)
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
    wsprintfW(message,L"%-4d,%-4d,%-4d,%-4d,%-4d %s\r\n",rc.left,rc.top,rc.right,rc.bottom,wd.showCmd,title);
    OutputDebugStringW(message);
    hWnds.push_back(hWnd);
    return TRUE;
}