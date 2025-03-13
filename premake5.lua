workspace "turhis"
    architecture "x64"
    configurations
    {
        "debug",
        "dist"
    }
    startproject "turhis"

outdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "turhis"
    language "C++"
    cppdialect "C++17"
    kind "consoleapp"

    targetdir "bin/%{outdir}"
    objdir    "bin-obj/%{outdir}"

    files
    {
        "src/**.hh",
        "src/**.cc"
    }

    includedirs
    {
        "src"
    }

    filter "system:windows"
        systemversion "latest"
        defines
        {
            "TH_PLATFORM_WINDOWS"
        }
    
    filter "system:linux"
        defines
        {
            "TH_PLATFORM_LINUX"
        }
    
    filter "configurations:debug"
        runtime "debug"
        symbols "on"
        defines
        {
            "TH_DEBUG"
        }
    
    filter "configurations:dist"
        runtime "release"
        optimize "speed"
        defines
        {
            "TH_SPEED"
        }
        