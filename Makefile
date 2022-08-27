package: clean
	python3 setup.py sdist bdist_wheel
	sh -c "auditwheel repair ./dist/qinfo_python*.whl --plat manylinux2014_x86_64"
	sh -c "rm dist/qinfo_python-*-linux_x86_64.whl -v"
	sh -c "cp wheelhouse/* dist/ -v"

upload: package
	twine upload dist/*

clean:
	rm -rf dist build *.egg-info wheelhouse

submodlue-latest:
	git submodule sync qinfo
	git submodule update --remote --merge