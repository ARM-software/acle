# SPDX-FileCopyrightText: Copyright 2026 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# frozen_string_literal: true

require "jekyll"

module JekyllPageTiming
  @start_times = {}

  def self.name(item)
    if item.respond_to?(:relative_path) && item.relative_path
      item.relative_path
    elsif item.respond_to?(:path) && item.path
      item.path
    elsif item.respond_to?(:url) && item.url
      item.url
    else
      item.inspect
    end
  end

  def self.start(item)
    @start_times[item.object_id] =
      Process.clock_gettime(Process::CLOCK_MONOTONIC)

    warn "START PAGE: #{name(item)}"
  end

  def self.finish(item)
    started_at = @start_times.delete(item.object_id)

    if started_at
      elapsed =
        Process.clock_gettime(Process::CLOCK_MONOTONIC) - started_at

      warn format("END PAGE: %s (%.3fs)", name(item), elapsed)
    else
      warn "END PAGE: #{name(item)}"
    end
  end
end

[:pages, :documents].each do |owner|
  Jekyll::Hooks.register owner, :pre_render do |item|
    JekyllPageTiming.start(item)
  end

  Jekyll::Hooks.register owner, :post_render do |item|
    JekyllPageTiming.finish(item)
  end
end