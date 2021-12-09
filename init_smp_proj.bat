md msvc
md source

@echo "Enter msvc.."
cd msvc
md include
@echo "Get OpenGL headers.."
md include\KHR
powershell -Command "Invoke-WebRequest https://www.khronos.org/registry/EGL/api/KHR/khrplatform.h -OutFile .\include\KHR\khrplatform.h"
md include\gl
powershell -Command "Invoke-WebRequest https://www.khronos.org/registry/OpenGL/api/GL/glext.h -OutFile .\include\gl\glext.h"
powershell -Command "Invoke-WebRequest https://www.khronos.org/registry/OpenGL/api/GL/wglext.h -OutFile .\include\gl\wglext.h"

@echo "Get ffnvcodec headers.."
rmdir /s /q include\ffnvcodec
md include\ffnvcodec
rmdir /s /q nv-codec-headers
git clone https://github.com/FFmpeg/nv-codec-headers.git && copy nv-codec-headers\include\ffnvcodec\* include\ffnvcodec /y
rmdir /s /q nv-codec-headers

@echo "Get AMF headers.."
rmdir /s /q include\AMF
md include\AMF
rmdir /s /q AMF
git clone https://github.com/GPUOpen-LibrariesAndSDKs/AMF.git && xcopy AMF\amf\public\include\* include\AMF /E
rmdir /s /q AMF
cd ..


@echo "Enter source.."
cd source
git clone https://github.com/ShiftMediaProject/FFmpeg.git && cd FFmpeg\SMP && project_get_dependencies.bat /Y

@echo "Job Done!"

pause