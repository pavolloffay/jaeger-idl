# Copyright (c) 2017 Uber Technologies, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

namespace java com.uber.jaeger.thriftjava

struct DependencyLink {
  /** parent service name (caller) */
  1: required string parent
  /** child service name (callee) */
  2: required string child
  # 3: Moments OBSOLETE_duration_moments
  /** calls made during the duration of this link */
  4: required i64 callCount
  # histogram?
}

/* An aggregate representation of services paired with every service they call. */
struct Dependencies {
  /** milliseconds from epoch */
  1: required i64 start_ts
  /** milliseconds from epoch */
  2: required i64 end_ts
  3: required list<DependencyLink> links
}

service Dependency {
    Dependencies getDependenciesForTrace(1: string traceId)
}
