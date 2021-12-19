#include <gflags/gflags.h>
#include <glog/logging.h>

DEFINE_string(foo, "a-la-la", "...");

int main(int argc, char **argv) {
  gflags::ParseCommandLineFlags(&argc, &argv, true);

  LOG(INFO) << FLAGS_foo;

  return 0;
}