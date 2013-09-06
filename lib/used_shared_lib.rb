require "used_shared_lib/version"
require "ffi"

module Helpers
  def self.fail?
    ENV['FAIL']
  end
end

module UsedSharedLib
  extend FFI::Library
  ffi_lib FFI::Library::LIBC
  attach_function :puts, [ :string ], :int
end

if Helpers.fail?

  module FailUsedSharedLib
    extend FFI::Library
    ffi_lib 'no_such_library'
    attach_function :puts, [ :string ], :int
  end

end
