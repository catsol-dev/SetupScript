#!/bin/bash

paru -S --needed rustup python3 python-pip clazy cmake lua valgrind cppcheck rust-analyzer swift-bin go ruby ruby-irb openjdk kotlin nodejs phonon-qt5 qt5-webkit qt5-script qt5-svg qt5-tools qt5-x11extras enchant jasper openexr libutempter docbook-xsl shared-mime-info giflib libxss upower udisks2 bzr git doxygen perl-json perl-libwww perl-xml-parser perl-io-socket-ssl akonadi xorg-server-devel libpwquality fontforge eigen libfakekey qca-qt5 xapian-core xsd gperf perl-yaml-syck intltool kdesdk qrencode libdmtx boost ruby-test-unit
rustup toolchain install nightly
mkdir -p ~/kde/src
cd ~/kde/src/
git clone https://invent.kde.org/sdk/kdesrc-build.git && cd kdesrc-build
./kdesrc-build --initial-setup
