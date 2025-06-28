vim.api.nvim_create_user_command("CmakeCreate", function()
	local cwd = vim.fn.getcwd()
	local debug_dir = cwd .. "/build/debug"
	local release_dir = cwd .. "/build/release"

	vim.fn.system({ "mkdir", "-p", "build/debug" })
	vim.fn.system({ "mkdir", "-p", "build/release" })

	vim.fn.system({ "touch", "CmakeFiles.txt" })

	vim.fn.system({
		"cmake",
		"-S",
		".",
		"-B",
		debug_dir,
		"-DCMAKE_BUILD_TYPE=Debug",
		"-DCMAKE_EXPORT_COMPILE_COMMANDS=TRUE",
		"-DCMAKE_C_COMPILER=clang",
		"-DCMAKE_CXX_COMPILER=clang++",
	})

	vim.fn.system({
		"cmake",
		"-S",
		".",
		"-B",
		release_dir,
		"-DCMAKE_BUILD_TYPE=Release",
		"-DCMAKE_EXPORT_COMPILE_COMMANDS=TRUE",
		"-DCMAKE_C_COMPILER=clang",
		"-DCMAKE_CXX_COMPILER=clang++",
	})
	print("CMake debug and release build directories created")
	require("oil").refresh()
end, {})

vim.api.nvim_create_user_command("CmakeBuild", function()
	local debug_output = vim.fn.system({ "cmake", "--build", "build/debug" })
	local release_output = vim.fn.system({ "cmake", "--build", "build/release" })

	print("Debug build output:\n" .. debug_output)
	print("Release build output:\n" .. release_output)
	require("oil").refresh()
end, {})
