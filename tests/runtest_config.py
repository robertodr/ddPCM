def configure(options, input_files, extra_args):
    """
    This function is used by runtest to configure runtest
    at runtime for code specific launch command and file naming.
    """

    from os import path
    from sys import platform

    inp = input_files

    if platform == "win32":
        exe = 'ddPCM.x.exe'
    else:
        exe = 'ddPCM.x'

    command = []
    command.append('{0}'.format(path.join(options.binary_dir, exe)))
    if extra_args is not None:
        command.append(extra_args)
    full_command = ' '.join(command)

    output_prefix = 'Output'

    relative_reference_path = 'result'

    return full_command, full_command, output_prefix, relative_reference_path
