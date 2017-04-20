#ifndef DDPCM_H_INCLUDED
#define DDPCM_H_INCLUDED

#include "ddPCMExport.h"

#define ddPCM_API ddPCM_EXPORT

/*! \file ddpcm.h
 *  \brief C API to ddPCM
 *  \author Roberto Di Remigio
 *  \date 2017
 */

#ifdef __cplusplus
extern "C" {
#endif

/*! \struct ddpcm_context_s
 *  Forward-declare opaque handle to a PCM context
 */
struct ddpcm_context_s;
/*! \typedef ddpcm_context_t
 *  Workaround to have ddpcm_context_t available to C
 */
typedef struct ddpcm_context_s ddpcm_context_t;

/*! \brief Creates a new ddPCM context object
 */
ddpcm_API ddpcm_context_t * ddpcm_new();

/*! \brief Deletes a ddPCM context object
 *  \param[in, out] context the ddPCM context object to be deleted
 */
ddpcm_API void ddpcm_delete(ddpcm_context_t * context);

#ifdef __cplusplus
}
#endif

#endif /* DDPCM_H_INCLUDED */
