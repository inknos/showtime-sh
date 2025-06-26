%global cli_name show
%global debug_package %{nil}


Name:           showtime
Version:        0.1
Release:        1%{?dist}
Summary:        Bash script to supercharge CLI demos

License:        GPL-2.0-or-later
URL:            https://codeberg.org/inknos/showtime
Source0:        %{url}/archive/v%{version}.tar.gz

BuildRequires:  make
BuildRequires:  python3-sphinx
Requires:       bash

Provides:       show

%description
Showtime is a bash script that provides a set of functions to present a bash
demo in a comprehensive and interoperable way.

%prep
%autosetup

%build
%make_build

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT%{_bindir}
mkdir -p $RPM_BUILD_ROOT%{_mandir}/man1
cp %{cli_name} $RPM_BUILD_ROOT%{_bindir}
cp docs/build/man/%{cli_name}.1 $RPM_BUILD_ROOT%{_mandir}/man1/%{cli_name}.1

%files
%{_bindir}/%{cli_name}
%license LICENSE
%doc %{_mandir}/man1/*

%changelog
* Wed Jun 25 2025 Nicola Sella <nsella@redhat.com>
- Initial test to build from RPM
