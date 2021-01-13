#/bin/bash
VERSION=$(cat ../../VERSION)
VER="${VERSION}_$(date '+%Y%m%d%H%M%S')"
X="-X github.com/yoooov/goproxy6.9/sdk/android-ios.SDK_VERSION=$VER -X main.APP_VERSION=$VER"

rm -rf sdk-android-*.tar.gz
rm -rf android
mkdir android

#android ; jdk,android ndk & android sdk required, install gomobile go1.10 required
#export GOPATH="$HOME/go"
#export GOROOT="/usr/local/go"
#export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
#export ANDROID_HOME="$HOME/Android/Sdk"
#export NDK_ROOT="$HOME/Android/Sdk/ndk-bundle"
#export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$NDK_ROOT:$PATH"
#go get -v golang.org/x/mobile/cmd/gomobile
#gomobile init

gomobile bind -v -target=android -javapkg=yoooov -ldflags="-s -w $X"
mv proxy.aar android/yoooov.goproxy.sdk.aar
mv proxy-sources.jar android/yoooov.goproxy.sdk-sources.jar
cp ../README.md android
tar zcfv sdk-android-${VERSION}.tar.gz android
rm -rf android

echo "done."
