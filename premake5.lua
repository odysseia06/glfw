project "GLFW"
	kind "StaticLib"
	language "C"
	warnings "off"
	staticruntime "on"
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir    ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files {
		"include/GLFW/*.h",
        "src/*.c"
	}
	filter "system:windows"
		defines { "_GLFW_WIN32", "_CRT_SECURE_NO_WARNINGS" }
		removefiles {
        "src/x11_*.c",
        "src/posix_*.c",
        "src/cocoa_*.c"
		}
	filter "system:linux"
		defines { "_GLFW_X11" }
		removefiles {
        "src/win32_*.c",
        "src/cocoa_*.c"
		}
	filter "configurations:Debug"
		symbols "on"
	filter "configurations:Release"
		optimize "speed"
	filter {} 