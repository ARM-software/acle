-- SPDX-FileCopyrightText: Copyright 2026 Arm Limited and/or its affiliates <open-source-office@arm.com>
-- SPDX-License-Identifier: Apache-2.0
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--     http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

local legacy_widths_bp = {
  ['diag-rep.svg'] = 323,
  ['state-trans.svg'] = 397,
  ['files-shared.svg'] = 459,
  ['exec-mem.svg'] = 421,
  ['stack-frame-entry.svg'] = 475,
  ['stack-frame-non-secure.svg'] = 475,
}

function Image(image)
  local width_bp = legacy_widths_bp[image.src]
  if FORMAT ~= 'latex' or not width_bp then
    return
  end

  image.attributes.width = string.format('%.6fin', width_bp / 72)
  return image
end
