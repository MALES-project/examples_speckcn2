import os


def convert_py_to_ipynb(py_file, ipynb_file):
    os.system(f'p2j {py_file} -t {ipynb_file} -o')


def convert_all_py_to_ipynb(directory):
    current_script = os.path.basename(__file__)
    for filename in os.listdir(directory):
        if filename.endswith('.py') and filename != current_script:
            py_file = os.path.join(directory, filename)
            ipynb_file = 'notebooks/' + os.path.splitext(py_file)[0] + '.ipynb'
            convert_py_to_ipynb(py_file, ipynb_file)
            print(f'Converted {py_file} to {ipynb_file}')


directory = '.'
convert_all_py_to_ipynb(directory)
