set(
	internal_sdl2_options

		"BUILD_SHARED_LIBS ${SRB2_CONFIG_SHARED_INTERNAL_LIBRARIES}"
		"SDL_SHARED ${SRB2_CONFIG_SHARED_INTERNAL_LIBRARIES}"
		"SDL_STATIC ${NOT_SRB2_CONFIG_SHARED_INTERNAL_LIBRARIES}"
		"SDL_TEST OFF"
		"SDL2_DISABLE_INSTALL ON"
)

if(${CMAKE_SYSTEM} MATCHES Windows)
	list(APPEND internal_sdl2_options "SDL2_DISABLE_SDL2MAIN OFF")
endif()
if(${CMAKE_SYSTEM} MATCHES Darwin)
	list(APPEND internal_sdl2_options "SDL2_DISABLE_SDL2MAIN OFF")
endif()
if(${CMAKE_SYSTEM} MATCHES Linux)
	list(APPEND internal_sdl2_options "SDL2_DISABLE_SDL2MAIN ON")
endif()

CPMAddPackage(
	NAME SDL2
	VERSION 2.24.2
	URL "https://github.com/libsdl-org/SDL/archive/refs/tags/release-2.24.2.zip"
	EXCLUDE_FROM_ALL ON
	OPTIONS ${internal_sdl2_options}
)
