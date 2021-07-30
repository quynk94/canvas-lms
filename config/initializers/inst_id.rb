# frozen_string_literal: true

#
# Copyright (C) 2021 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
require 'inst_id'

configure_inst_id = proc do
  creds = Rails.application.credentials.inst_id
  if creds
    InstID.configure(
      signing_key: creds[:signing_key],
      encryption_key: creds[:encryption_key]
    )
  end
end

Rails.configuration.after_initialize(&configure_inst_id)
Canvas::Reloader.on_reload(&configure_inst_id)