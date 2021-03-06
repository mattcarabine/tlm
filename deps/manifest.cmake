#
# Keep the list sorted alphabetically, and the platforms alphabetically.
# The syntax is:
#
# DECLARE_DEP (name VERSION version-revision PLATFORMS platform1 platform2)
#
# This manifest contains entries for SUPPORTED platforms. These are
# platforms on which Couchbase builds and delivers Server binaries
# to customers.
#
# The list of supported platforms may change between releases, but
# you may use the cmake macro CB_GET_SUPPORTED_PLATFORM to
# check if this is a supported platform.
#
# IMPORTANT: If you add a new package here or update an existing package
# version, you must also update couchbase-server-black-duck-manifest.json
# in this same directory!
#
DECLARE_DEP (breakpad V2 VERSION 20200430 BUILD 1 PLATFORMS amzn2 centos7 centos8 debian9 debian10 suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04 windows_msvc2017)
DECLARE_DEP (boost VERSION 1.67.0-cb8 PLATFORMS amzn2 centos7 centos8 debian8 debian9 debian10 macosx rhel8 suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04 windows_msvc2017)
DECLARE_DEP (curl V2 VERSION 7.66.0 BUILD 7 PLATFORMS amzn2 centos7 centos8 debian8 debian9 debian10 macosx rhel8 suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04 windows_msvc2017)
DECLARE_DEP (double-conversion VERSION 3.0.0-cb2 PLATFORMS amzn2 centos6 centos7 debian8 debian9 macosx suse12 suse15 ubuntu16.04 ubuntu18.04 windows_msvc2015 windows_msvc2017)
DECLARE_DEP (double-conversion VERSION 3.0.0-cb4 PLATFORMS centos8 debian10 rhel8 ubuntu20.04)
DECLARE_DEP (erlang VERSION OTP-20.3.8.20-cb1 PLATFORMS amzn2 centos7 centos8 debian8 debian9 debian10 macosx suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04 windows_msvc2017)
DECLARE_DEP (flatbuffers VERSION 1.10.0-cb5 PLATFORMS amzn2 centos7 centos8 debian8 debian9 debian10 macosx rhel8 suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04 windows_msvc2017)
DECLARE_DEP (folly VERSION v2019.08.12.00-cb4 PLATFORMS amzn2 centos7 centos8 debian8 debian9 debian10 macosx rhel8 suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04 windows_msvc2017)
DECLARE_DEP (glog VERSION 0.3.5-cb4 PLATFORMS amzn2 centos6 centos7 centos8 debian8 debian9 debian10 macosx rhel8 suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04 windows_msvc2015 windows_msvc2017)
DECLARE_DEP (grpc VERSION 1.28.1-cb1 PLATFORMS amzn2 centos7 centos8 debian8 debian9 debian10 macosx rhel8 suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04 windows_msvc2017)
DECLARE_DEP (jemalloc VERSION 5.2.1-cb4 PLATFORMS amzn2 centos7 centos8 debian8 debian9 debian10 macosx rhel8 suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04 windows_msvc2017)
DECLARE_DEP (json VERSION 3.5.0-cb1 PLATFORMS amzn2 centos7 debian8 debian9 macosx suse12 suse15 ubuntu16.04 ubuntu18.04 windows_msvc2017)
DECLARE_DEP (json VERSION 3.5.0-cb2 PLATFORMS centos8 debian10 rhel8 ubuntu20.04)
DECLARE_DEP (libevent VERSION 2.1.11-cb6 PLATFORMS amzn2 centos7 centos8 debian8 debian10 debian9 macosx rhel8 suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04 windows_msvc2017)
DECLARE_DEP (libuv VERSION 1.20.3-cb1 PLATFORMS centos6 debian7 suse11 ubuntu14.04 windows_msvc2015)
DECLARE_DEP (libuv V2 VERSION 1.20.3 BUILD 17 PLATFORMS amzn2 centos7 debian8 debian9 macosx suse12 suse15 ubuntu16.04 ubuntu18.04 windows_msvc2017)
DECLARE_DEP (libuv V2 VERSION 1.20.3 BUILD 19 PLATFORMS centos8 debian10 rhel8 ubuntu20.04)
DECLARE_DEP (lz4 VERSION 1.8.0-cb2 PLATFORMS amzn2 centos6 centos7 debian8 debian9 macosx suse11 suse12 suse15 ubuntu14.04 ubuntu16.04 ubuntu18.04)
DECLARE_DEP (lz4 VERSION 1.8.0-cb4 PLATFORMS centos8 debian10 rhel8 ubuntu20.04)
DECLARE_DEP (maven VERSION 3.5.2-cb5 PLATFORMS amzn2 centos6 centos7 debian8 debian9 macosx suse11 suse12 suse15 ubuntu14.04 ubuntu16.04 ubuntu18.04 windows_msvc2015 windows_msvc2017)
DECLARE_DEP (maven VERSION 3.5.2-cb6 PLATFORMS centos8 debian10 rhel8 ubuntu20.04)
DECLARE_DEP (numactl VERSION 2.0.11-cb1 PLATFORMS amzn2 centos6 centos7 debian7 debian8 debian9 suse11 suse12 suse15 ubuntu14.04 ubuntu16.04 ubuntu18.04)
DECLARE_DEP (numactl VERSION 2.0.11-cb3 PLATFORMS centos8 debian10 rhel8 ubuntu20.04)
DECLARE_DEP (openjdk-rt VERSION 1.8.0.171-cb1 PLATFORMS amzn2 centos6 centos7 debian8 debian9 macosx suse11 suse12 suse15 ubuntu14.04 ubuntu16.04 ubuntu18.04 windows_msvc2015 windows_msvc2017)
DECLARE_DEP (openjdk-rt VERSION 1.8.0.171-cb2 PLATFORMS centos8 debian10 rhel8 ubuntu20.04)
DECLARE_DEP (openssl VERSION 1.1.1d-cb1 PLATFORMS windows_msvc2017)
DECLARE_DEP (openssl VERSION 1.1.1d-cb2 PLATFORMS amzn2 centos7 centos8 debian8 debian9 debian10 macosx rhel8 suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04)
DECLARE_DEP (opentracing-cpp VERSION v1.5.1-cb1 PLATFORMS amzn2 centos7 debian8 debian9 macosx suse11 suse12 ubuntu16.04 ubuntu18.04)
DECLARE_DEP (opentracing-cpp VERSION v1.5.1-cb2 PLATFORMS windows_msvc2017)
DECLARE_DEP (opentracing-cpp VERSION v1.5.1-cb4 PLATFORMS centos8 debian10 rhel8 ubuntu20.04)
DECLARE_DEP (pcre VERSION 8.43-cb1 PLATFORMS amzn2 centos7 centos8 debian8 debian9 debian10 rhel8 suse12 suse15 ubuntu16.04 ubuntu18.04 windows_msvc2017)
DECLARE_DEP (pcre VERSION 8.43-cb2 PLATFORMS macosx ubuntu20.04)
DECLARE_DEP (prometheus V2 VERSION 2.17.2 BUILD 1 PLATFORMS amzn2 centos7 centos8 debian8 debian9 debian10 macosx suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04 windows_msvc2017)
DECLARE_DEP (protoc-gen-go V2 VERSION 1.2.5 BUILD 3 PLATFORMS amzn2 centos7 centos8 debian8 debian9 debian10 macosx suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04 windows_msvc2017)
# We don't want RocksDB to end up in shipped production builds.
# NB: I don't indent this IF() block just in case, because I know that some
# scripts (such as escrow) parse this file manually.
IF (NOT CB_PRODUCTION_BUILD)
DECLARE_DEP (rocksdb VERSION 5.18.3-cb5 PLATFORMS amzn2 centos7 centos8 debian8 debian9 debian10 macosx rhel8 suse12 suse15 ubuntu16.04 ubuntu18.04)
ENDIF (NOT CB_PRODUCTION_BUILD)
DECLARE_DEP (snappy VERSION 1.1.1 PLATFORMS windows_msvc2015 windows_msvc2017)
DECLARE_DEP (snappy VERSION 1.1.1-cb3 PLATFORMS amzn2 centos6 centos7 debian8 debian9 macosx suse11 suse12 suse15 ubuntu14.04 ubuntu16.04 ubuntu18.04)
DECLARE_DEP (snappy VERSION 1.1.1-cb5 PLATFORMS centos8 debian10 rhel8 ubuntu20.04)
DECLARE_DEP (v8 VERSION 7.1-cb5 PLATFORMS amzn2 centos7 centos8 debian8 debian9 debian10 macosx rhel8 suse12 suse15 ubuntu16.04 ubuntu18.04 ubuntu20.04)
DECLARE_DEP (v8 VERSION 7.1-cb4 PLATFORMS windows_msvc2017)
DECLARE_DEP (zlib VERSION 1.2.11-cb3 PLATFORMS centos6 suse11 ubuntu14.04 windows_msvc2015)
DECLARE_DEP (zlib V2 VERSION 1.2.11 BUILD 4 PLATFORMS amzn2 centos7 debian8 debian9 macosx suse12 suse15 ubuntu16.04 ubuntu18.04 windows_msvc2017)
DECLARE_DEP (zlib V2 VERSION 1.2.11 BUILD 6 PLATFORMS centos8 debian10 rhel8 ubuntu20.04)
