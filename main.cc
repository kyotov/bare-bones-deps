#include <gflags/gflags.h>
#include <glog/logging.h>

DEFINE_string(foo, "a-la-la", "...");

int main(int argc, char **argv) {
  google::InitGoogleLogging(argv[0]);
  gflags::ParseCommandLineFlags(&argc, &argv, true);

  FLAGS_logtostderr = true;

  LOG(INFO) << FLAGS_foo;

  return 0;
}