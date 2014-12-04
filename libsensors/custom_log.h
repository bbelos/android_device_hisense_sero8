/*  --------------------------------------------------------------------------------------------------------
 *  Copyright(C), 2009-2010, Fuzhou Rockchip Co., Ltd.  All Rights Reserved.
 *
 *  Author: ChenZhen
 *
 *  Version: 1.0
 *
 *  Log: Tue Mar 02 21:30:33 2010
 *        
 *  --------------------------------------------------------------------------------------------------------
 */

#ifndef __CUSTOM_LOG_H__
#define __CUSTOM_LOG_H__

#ifdef __cplusplus
extern "C" {
#endif

/* ---------------------------------------------------------------------------------------------------------
 *  Include Files
 * ---------------------------------------------------------------------------------------------------------
 */
#include <cutils/log.h>
    
/* ---------------------------------------------------------------------------------------------------------
 *  Macros Definition 
 * ---------------------------------------------------------------------------------------------------------
 */
// #define ENABLE_DEBUG_LOG
#define LOG_FILE_PATH

/*-----------------------------------*/

#if  PLATFORM_SDK_VERSION >= 16
#define LOGV(fmt,args...) ALOGV(fmt,##args)
#define LOGD(fmt,args...) ALOGD(fmt,##args)
#define LOGI(fmt,args...) ALOGI(fmt,##args)
#define LOGW(fmt,args...) ALOGW(fmt,##args)
#define LOGE(fmt,args...) ALOGE(fmt,##args)
#define LOGE_IF(cond,fmt,args...)	  ALOGE_IF(cond,fmt,##args)
#endif

#ifdef ENABLE_DEBUG_LOG

#ifdef LOG_FILE_PATH
#define D(fmt, args...) \
    { LOGD("[File] : %s; [Line] : %d; [Func] : %s() ; " fmt, __FILE__, __LINE__, __FUNCTION__, ## args); }
#else
#define D(fmt, args...) \
    { LOGD("[Line] : %d; [Func] : %s() ; " fmt, __LINE__, __FUNCTION__, ## args); }
#endif

#else
#define D(...)  ((void)0)
#endif

/*-----------------------------------*/

#ifdef ENABLE_DEBUG_LOG

#ifdef LOG_FILE_PATH
#define I(fmt, args...) \
    { LOGI("[File] : %s; [Line] : %d; [Func] : %s() ; ! Info : " fmt, __FILE__, __LINE__, __FUNCTION__, ## args); }
#else
#define I(fmt, args...) \
    { LOGI("[Line] : %d; [Func] : %s() ; ! Info : " fmt, __LINE__, __FUNCTION__, ## args); }
#endif
#else
#define I(...)  ((void)0)
#endif

/*-----------------------------------*/

#ifdef ENABLE_DEBUG_LOG
#ifdef LOG_FILE_PATH
#define W(fmt, args...) \
    { LOGW("[File] : %s; [Line] : %d; [Func] : %s() ; !! Warning : " fmt, __FILE__, __LINE__, __FUNCTION__, ## args); }
#else
#define W(fmt, args...) \
    { LOGW("[Line] : %d; [Func] : %s() ; !! Warning : " fmt, __LINE__, __FUNCTION__, ## args); }
#endif
#else
#define W(...)  ((void)0)
#endif

/*-----------------------------------*/

#ifdef ENABLE_DEBUG_LOG
#ifdef LOG_FILE_PATH
#define E(fmt, args...) \
    { LOGE("[File] : %s; [Line] : %d; [Func] : %s() ; !!! Error : " fmt, __FILE__, __LINE__, __FUNCTION__, ## args); }
#else
#define E(fmt, args...) \
    { LOGE("[Line] : %d; [Func] : %s() ; !!! Error : " fmt, __LINE__, __FUNCTION__, ## args); }
#endif
#else
#define E(...)  ((void)0)
#endif

/*-----------------------------------*/

#ifdef ENABLE_DEBUG_LOG
#define D_WHEN_REPEAT(threshold, fmt, args...) \
    do { \
        static int count = 0; \
        if ( 0 == count || (count++) == threshold ) { \
            D(fmt, ##args); \
            count = 1; \
        } \
    } while (0)
#else
#define D_WHEN_REPEAT(...)  ((void)0)
#endif
    
/* ---------------------------------------------------------------------------------------------------------
 *  Types and Structures Definition
 * ---------------------------------------------------------------------------------------------------------
 */


/* ---------------------------------------------------------------------------------------------------------
 *  Global Functions' Prototype
 * ---------------------------------------------------------------------------------------------------------
 */


/* ---------------------------------------------------------------------------------------------------------
 *  Inline Functions Implementation 
 * ---------------------------------------------------------------------------------------------------------
 */

#ifdef __cplusplus
}
#endif

#endif /* __CUSTOM_LOG_H__ */
