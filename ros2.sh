sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8


sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository -y universe
sudo apt install -y curl gnupg2 lsb-release build-essential

sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt install -y ros-galactic-ros-base
sudo apt install -y python3-argcomplete
sudo apt install -y python3-colcon-common-extensions
sudo apt install -y python3-rosdep python3-vcstool # https://index.ros.org/doc/ros2/Installation/Linux-Development-Setup/
[ -e /etc/ros/rosdep/sources.list.d/20-default.list ] ||
sudo rosdep init
rosdep update --include-eol-distros # https://discourse.ros.org/t/rosdep-and-eol-distros/7640

echo "alias galactic=\"source /opt/ros/galactic/setup.bash;echo 'Galactic is Active'\"" >> ~/.bashrc
source ~/.bashrc
