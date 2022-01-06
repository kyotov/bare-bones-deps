set(KYDEPS_CACHE_BUCKET "https://kydeps.nyc3.digitaloceanspaces.com")


#  MANIFEST[gflags]
#  ----------
#  CMAKE_BUILD_TYPE=Debug
#  CMAKE_SYSTEM=Darwin-20.6.0
#  CMAKE_SYSTEM_PROCESSOR=arm64
#  ----------
#  GIT_REPOSITORY
#  https://github.com/gflags/gflags.git
#  GIT_TAG
#  f8a0efe03aa69b3336d8e228b37d4ccb17324b88
#  CMAKE_ARGS
#  -DREGISTER_INSTALL_PREFIX=FALSE
#  -DGFLAGS_BUILD_STATIC_LIBS=TRUE
#  -DGFLAGS_BUILD_SHARED_LIBS=FALSE
#  -DGFLAGS_BUILD_TESTING=FALSE
#  ----------
#
KyDepRegister(
    6eaf42029d5dccbe1678f14cd25c610154a01046
    ${KYDEPS_CACHE_BUCKET}/gflags.6eaf42029d5dccbe1678f14cd25c610154a01046.zip
    39f47f13f5a691cc7e079ae808c6e775fe82d53b75e9ef6ea06715d14711ee5f
)
                
#  MANIFEST[glog]
#  ----------
#  CMAKE_BUILD_TYPE=Debug
#  CMAKE_SYSTEM=Darwin-20.6.0
#  CMAKE_SYSTEM_PROCESSOR=arm64
#  ----------
#  GIT_REPOSITORY
#  https://github.com/google/glog.git
#  GIT_TAG
#  96a2f23dca4cc7180821ca5f32e526314395d26a
#  CMAKE_ARGS
#  -DBUILD_TESTING=FALSE
#  CMAKE_ARGS
#  -DCMAKE_PREFIX_PATH:PATH=.../i/gflags.6eaf42029d5dccbe1678f14cd25c610154a01046
#  DEPENDS
#  gflags
#  ----------
#
KyDepRegister(
    236475e2004877b4de772255bf8946d01d02f2a7
    ${KYDEPS_CACHE_BUCKET}/glog.236475e2004877b4de772255bf8946d01d02f2a7.zip
    97a2aa2012ea47240ec5ca71758932c73fcc9d442f203957541e8f3bc8e964d3
)
                
#  MANIFEST[GTest]
#  ----------
#  CMAKE_BUILD_TYPE=Debug
#  CMAKE_SYSTEM=Darwin-20.6.0
#  CMAKE_SYSTEM_PROCESSOR=arm64
#  ----------
#  GIT_REPOSITORY
#  https://github.com/google/googletest.git
#  GIT_TAG
#  e2239ee6043f73722e7aa812a459f54a28552929
#  ----------
#
KyDepRegister(
    bf23d61b1cabe072026b445dc322479efdf73b78
    ${KYDEPS_CACHE_BUCKET}/GTest.bf23d61b1cabe072026b445dc322479efdf73b78.zip
    597f6d3b4c66803d9b7c6ea33b12c5337f3d5eb46f0fc1d570cac8ebbe2470a4
)
                